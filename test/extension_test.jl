using LoggingPolyglot

function test_loggingpolyglot_ext()
    langs_dict = Dict(
        1 => Dict(
            "en" => "Hello!",
            "pt" => "Olá!",
        ),
        2 => Dict(
            "en" => "The file @@@ does not exist.",
            "pt" => "O arquivo @@@ não existe.",
        ),
        3 => Dict(
            "en" => "Iteration @@@",
            "pt" => "Iteração @@@",
        ),
        4 => Dict(
            "en" => "Iteration @@@ @@@ @@@",
            "pt" => "Iteração @@@ @@@ @@@",
        ),
    )
    LoggingPolyglot.set_dict(langs_dict)
    LoggingPolyglot.set_language("pt")
    init_validations()

    validation_error(;
        collection = "ElementCollection",
        attribute = "ElementName2",
        identifier = "Id",
        message = (3, "10"),
    )

    @test num_validation_errors() == 1
    @test has_validation_errors() == true

    LoggingPolyglot.set_language("en")

    validation_error(;
        collection = "ElementCollection",
        attribute = "ElementName2",
        identifier = "Id",
        message = (3, "10"),
    )

    validation_error(;
        collection = "ElementCollection",
        attribute = "ElementName3",
        identifier = "Id",
        message = (4, "10", "11", "12"),
    )

    validation_dict = SimpleValidations._create_validation_vector_dict()

    @test validation_dict[1]["message"] == "Iteração 10"
    @test validation_dict[2]["message"] == "Iteration 10"
    @test validation_dict[3]["message"] == "Iteration 10 11 12"
end

test_loggingpolyglot_ext()
