# SimpleValidations.jl
Interface for making simple validations in the database. 

You use it to collect different validation errors across your application and display them in a JSON file.


[build-img]: https://github.com/psrenergy/SimpleValidations.jl/workflows/CI/badge.svg?branch=master
[build-url]: https://github.com/psrenergy/SimpleValidations.jl/actions?query=workflow%3ACI

[codecov-img]: https://codecov.io/gh/psrenergy/SimpleValidations.jl/coverage.svg?branch=master
[codecov-url]: https://codecov.io/gh/psrenergy/SimpleValidations.jl?branch=master

| **Build Status** | **Coverage** | 
|:-----------------:|:-----------------:|
| [![Build Status][build-img]][build-url] | [![Codecov branch][codecov-img]][codecov-url] |


## Getting Started

### Installation
```julia
julia> ]add https://github.com/psrenergy/SimpleValidations.jl#master
```

### Basic Usage

```julia
using SimpleValidations

init_validations()

struct Student
    name::String
    grade::Real
    student_id::String
end

john_smith = Student("John Smith", -5.0, "1234567890")

if john_smith.grade < 0
    validation_error(
        collection = "Student",
        attribute = "Grade", 
        identifier = john_smith.student_id,
        message = "Grade cannot be negative",
    )
end

dump_validation_errors("validation_errors.json")
```