module SimpleValidations

using JSON
using OrderedCollections
import LoggingPolyglot as Log

export num_validation_errors,
    has_validation_errors, init_validations, validation_error, dump_validation_errors

include("interface.jl")
include("validations.jl")
include("io.jl")

const VALIDATIONS = Vector{ValidationError}()

end # module SimpleValidations
