```
From Louden & Lambert's "Programming Languages: Principles and Practice"

In the following grammar:

    =   means "is defined as"
    " " enclose literal items
    [ ] enclose items which may be omitted
    { } enclose items which may appear zero or more times
    |   indicates a choice
    ( ) are used for grouping required choices
    < > enclose semantic qualifications

subprogramBody =
        subprogramSpecification "is"
        declarativePart
        "begin" sequenceOfStatements
        "end" [ <procedure>identifier ] ";"

declarativePart = { basicDeclaration }

basicDeclaration = objectDeclaration | numberDeclaration
        | typeDeclaration | subprogramBody

objectDeclaration =
        identifierList ":" typeDefinition ";"

numberDeclaration =
        identifierList ":" "constant" ":=" <static>expression ";"

identifierList = identifier { "," identifier }

typeDeclaration = "type" identifier "is" typeDefinition ";"

typeDefinition = enumerationTypeDefinition | arrayTypeDefinition
        | range | <type>name

range = "range " simpleExpression ".." simpleExpression

index = range | <type>name

enumerationTypeDefinition = "(" identifierList ")"

arrayTypeDefinition = "array" "(" index { "," index } ")" "of" <type>name

subprogramSpecification = "procedure" identifier [ formalPart ]

formalPart = "(" parameterSpecification { ";" parameterSpecification } ")"

parameterSpecification = identifierList ":" mode <type>name

mode = [ "in" ] | "in" "out" | "out"

sequenceOfStatements = statement { statement }

statement = simpleStatement | compoundStatement

simpleStatement = nullStatement | assignmentStatement
    | procedureCallStatement | exitStatement

compoundStatement = ifStatement | loopStatement

nullStatement = "null" ";"

assignmentStatement = <variable>name ":=" expression ";"

ifStatement =
        "if" condition "then" sequenceOfStatements
        { "elsif" condition "then" sequenceOfStatements }
        [ "else" sequenceOfStatements ]
        "end" "if" ";"

loopStatement =
        [ iterationScheme ] "loop" sequenceOfStatements "end" "loop" ";"

iterationScheme = "while" condition

exitStatement = "exit" [ "when" condition ] ";"

procedureCallStatement = <procedure>name [ actualParameterPart ] ";"

actualParameterPart = "(" expression { "," expression } ")"

condition = <boolean>expression

expression = relation { "and" relation } | { "or" relation }

relation = simpleExpression [ relationalOperator simpleExpression ]

simpleExpression =
        [ unaryAddingOperator ] term { binaryAddingOperator term }

term = factor { multiplyingOperator factor }

factor = primary [ "**" primary ] | "not" primary

primary = numericLiteral | stringLiteral | name | "(" expression ")"

name = identifier [ indexedComponent ]

indexedComponent = "(" expression { "," expression } ")"

relationalOperator = "=" | "/=" | "<" | "<=" | ">" | ">="

binaryAddingOperator = "+" | "-"

unaryAddingOperator = "+" | "-"

multiplyingOperator = "*" | "/" | "mod"
```