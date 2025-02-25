
function _log2_einsize(eincode::ET, size_dict::Dict{LT, Int}) where {ET, LT}
    return foldl((x, y) -> x + log2(size_dict[y]), eincode.iy, init = 0.0)
end

function get_subtree(code::CT, size_dict::Dict{LT, Int}, threshold::T) where {CT, LT, T}
    for subtree in PostOrderDFS(code)
        (subtree isa OMEinsum.LeafString) && continue
        if _log2_einsize(subtree.eins, size_dict) > threshold
            return subtree
        end
    end
    # if no subtree larger than threshold, return the whole code
    return code
end