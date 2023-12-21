using SimpleValidations

using Test

@testset "SimpleValidations.jl" begin
    include("basic_test.jl")
    include("extension_test.jl")
end
