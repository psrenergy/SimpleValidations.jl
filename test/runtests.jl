using SimpleValidations

using Test

@testset "SimpleValidations.jl" begin
    init_validations()

    @test num_validation_errors() == 0

    validation_error(;
        collection = "ElementCollection",
        attribute = "ElementName",
        identifier = "Id",
        message = "test message",
    )

    validation_error(;
        collection = "ElementCollection",
        attribute = "ElementName2",
        identifier = "Id",
    )

    @test num_validation_errors() == 2
    @test has_validation_errors() == true

    dump_validation_errors(raw"./test.json")

    init_validations()

    @test num_validation_errors() == 0
end
