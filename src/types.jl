abstract type AbstractTensorNetwork end

mutable struct TensorNetwork{CT, TT, LT} <: AbstractTensorNetwork
    code::CT
    tensors::Vector{AbstractArray{TT}}
    size_dict::Dict{LT, Int}
end

struct BooleanTensorNetwork{CT, LT} <: AbstractTensorNetwork
    code::CT
    tensors::Vector{AbstractArray{Bool}}
    size_dict::Dict{LT, Int}
end

struct Branch{TT}
    fixed::Vector{Tuple{Int, Int}} # fixed indices and dims
    unfixed::Vector{Int} # unfixed indices
    tensor::AbstractArray{TT} # the generated tensor
end