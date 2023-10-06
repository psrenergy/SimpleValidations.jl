using SimpleValidations

using Test

@testset "SimpleValidations.jl" begin
    init_validations()

    @test num_validation_errors() == 0

    validation_error(;
        element_collection = "ElementCollection",
        element_name = "ElementName",
        element_identifier = "Id",
        message = "test message",
    )

    validation_error(;
        element_collection = "ElementCollection",
        element_name = "ElementName2",
        element_identifier = "Id",
    )

    @test num_validation_errors() == 2
    @test has_validation_errors() == true

    @test_throws ValidationException throw(ValidationException())

    dump_validation_errors(raw"test.json")

    init_validations()

    @test num_validation_errors() == 0
end
