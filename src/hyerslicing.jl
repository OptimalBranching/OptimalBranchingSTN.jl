# slicing the intermediate tensors and rebuild the tensor network

# function subtree_branch(code::CT, subtree::ST, tensors::Vector{AbstractArray{TT}}) where {CT, ST, TT}
#     # naive branch, each element to one branch
#     return naive_branch(subtree, tensors)
# end

function naive_branch(subtree::ST, tensors::Vector{Array{TT}}) where {ST, TT}
    subtensor = subtree(tensors...)
    iys = subtree.eins.iy
    # each non-zero element corresponds to one branch
    branches = Vector{Branch{TT}}()
    for cart in CartesianIndices(subtensor)
        (subtensor[cart] == zero(TT)) && continue
        fixed = Tuple{Int, Int}[(iy, cart[i]) for (i, iy) in enumerate(iys)]
        unfixed = Int[]
        tensor = fill(subtensor[cart])
        push!(branches, Branch(fixed, unfixed, tensor))
    end
    return branches
end


# TODO: revise the contraction order according to the branches
# 1. for each branch, replace the subtree with the new intermediate tensor