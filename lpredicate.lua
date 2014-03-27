local pred_mt = {}


local predicate = function(f)
    return setmetatable({apply=f}, pred_mt)
end


pred_mt.__call = function (t, ...) return t.apply(...) end


pred_mt.__band = function(p1, p2)
    local f = function (...)
        return p1(...) and p2(...)
    end
    return predicate(f)
end


pred_mt.__bor = function(p1, p2)
    local f = function (...)
        return p1(...) or p2(...)
    end
    return predicate(f)
end


pred_mt.__bxor = function(p1, p2)
    local f = function (...)
        return p1(...) ~= p2(...)
    end
    return predicate(f)
end


pred_mt.__bnot = function(p)
    local f = function (...)
        return not p(...)
    end
    return predicate(f)
end


return {
    _VERSION = '0.1',
    predicate = predicate,
}
