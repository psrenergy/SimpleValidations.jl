module SimpleValidations

using JSON
using OrderedCollections

export num_validation_errors,
    has_validation_errors, 
    init_validations, 
    validation_error, 
    dump_validation_errors,
    ValidationException

    
include("validations.jl")
include("io.jl")
include("exceptions.jl")

const VALIDATIONS = Vector{ValidationError}(undef, 0)

end # module SimpleValidations
