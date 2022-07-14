using StatsBase
function perc(state)
    ker = [0.0 1.0 0.0; 1.0 -4.0 1.0; 0.0 1.0 0.0]
    nb = imfilter(state, ker)
    state[(state .== 1) .& (nb .> 0)] .= 5
end

using ImageFiltering
function lattice(n::Int64 = 100, p::Float64 = 0.7)
    istate = sample([0, 1], weights([1 - p, p]), (n, n))
    istate[n, :] .= 5
    istate
end
