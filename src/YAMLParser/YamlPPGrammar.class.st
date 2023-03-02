Class {
	#name : #YamlPPGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'number',
		'scalar',
		'value',
		'key',
		'mappingValue',
		'mapping',
		'newline',
		'indent',
		'dedent',
		'mappingList',
		'indentedMappingList',
		'document',
		'integer',
		'decimalInteger',
		'comment',
		'notAnEscapedQuote',
		'doubleQuotedString',
		'stringWithinDoubleQuotes',
		'doubledSingleQuotes',
		'stringWithinSingleQuotes',
		'singleQuotedString',
		'dedentToken',
		'indentToken',
		'initialScalarStringChars',
		'scalarString',
		'listItem',
		'list',
		'listValue'
	],
	#category : #'YAMLParser-PParser'
}

{ #category : #accessing }
YamlPPGrammar class >> ignoredNames [
	^ super ignoredNames copyWithAll: #(indentToken dedentToken)
]

{ #category : #grammar }
YamlPPGrammar >> comment [
	"NB: hack to not recognize #{INDENT}# or #{DEDENT}# as comments"

	<todo: 'What do we do with comments?'>
	^ $# asPParser , ${ asPParser not , #newline asPParser negate plus
]

{ #category : #grammar }
YamlPPGrammar >> decimalInteger [
	<todo: 'Convert to a number'>
	^ ($0 asPParser not , #digit asPParser plus) ==> #second
]

{ #category : #grammar }
YamlPPGrammar >> dedent [
	^ self dedentToken asPParser
]

{ #category : #grammar }
YamlPPGrammar >> dedentToken [
	dedentToken ifNil: [ dedentToken := self defaultDedentToken ].
	^ dedentToken
]

{ #category : #accessing }
YamlPPGrammar >> dedentToken: anObject [
	dedentToken := anObject
]

{ #category : #grammar }
YamlPPGrammar >> defaultDedentToken [
	^ '#{DEDENT}#'
]

{ #category : #grammar }
YamlPPGrammar >> defaultIndentToken [
	^ '#{INDENT}#'
]

{ #category : #grammar }
YamlPPGrammar >> document [
	<todo: 'Add list, flowList and flowMappingList'>
	^ (list / mappingList / value) end
]

{ #category : #grammar }
YamlPPGrammar >> doubleQuotedString [
	<todo: 'Process escape sequences?'>
	^ ($" asPParser , stringWithinDoubleQuotes , $" asPParser) ==> #second
]

{ #category : #grammar }
YamlPPGrammar >> doubledSingleQuotes [
	^ ($' asPParser , $' asPParser) ==> #first
]

{ #category : #grammar }
YamlPPGrammar >> indent [
	^ self indentToken asPParser
]

{ #category : #grammar }
YamlPPGrammar >> indentToken [
	indentToken ifNil: [ indentToken := self defaultIndentToken ].
	^ indentToken
]

{ #category : #accessing }
YamlPPGrammar >> indentToken: anObject [
	indentToken := anObject
]

{ #category : #grammar }
YamlPPGrammar >> indentedMappingList [
	^ indent , mappingList , dedent
]

{ #category : #grammar }
YamlPPGrammar >> initialScalarStringChars [
	"Taken from the ANTLR Scanner
	https://github.com/umaranis/FastYaml/blob/master/src/antlr/YamlLexer.g4
	fragment STRING_MY_START
	"
	^ ($- asPParser / #blank asPParser / #newline asPParser / $: asPParser
		/ $# asPParser / ${ asPParser / $[ asPParser / $& asPParser / $* asPParser) negate 
		/ ($: asPParser , (#blank asPParser / #newline asPParser) negate)
		/ ($- asPParser , (#blank asPParser / $- asPParser / #newline asPParser) negate)
]

{ #category : #grammar }
YamlPPGrammar >> integer [
	<todo: 'Add octal, hex and binary integers.'>
	^ decimalInteger
]

{ #category : #grammar }
YamlPPGrammar >> key [
	^ scalarString
]

{ #category : #grammar }
YamlPPGrammar >> list [
	^ listItem , (newline / listItem) star
]

{ #category : #grammar }
YamlPPGrammar >> listItem [
	^ $- asPParser trim, listValue 
]

{ #category : #grammar }
YamlPPGrammar >> listValue [
	^ indentedMappingList / value
]

{ #category : #grammar }
YamlPPGrammar >> mapping [
	^ (key , $: asPParser trim , mappingValue)
]

{ #category : #grammar }
YamlPPGrammar >> mappingList [
	^ mapping , (newline / mapping) star
]

{ #category : #grammar }
YamlPPGrammar >> mappingValue [
	^ indentedMappingList / value
]

{ #category : #grammar }
YamlPPGrammar >> newline [
	^ #newline asPParser
]

{ #category : #grammar }
YamlPPGrammar >> notAnEscapedQuote [
	^ ($\ asPParser / $" asPParser) negate
]

{ #category : #grammar }
YamlPPGrammar >> number [
	<todo: 'Add floats and imaginary numbers'>
	^ integer
]

{ #category : #grammar }
YamlPPGrammar >> scalar [
	^ scalarString / number
]

{ #category : #grammar }
YamlPPGrammar >> scalarString [
	"Taken from the ANTLR Scanner
	https://github.com/umaranis/FastYaml/blob/master/src/antlr/YamlLexer.g4
	STRING_MY
	Adapted to fail when encountering #{... after the first char.
	"

	^ initialScalarStringChars
		, (($# asPParser , ${ asPParser not)
				/ ($# asPParser / #blank asPParser / #newline asPParser / $" asPParser
						/ $: asPParser) negate
				/ ($: asPParser , (#blank asPParser / #newline asPParser) negate)
				/ (#blank asPParser plus
						, (#blank asPParser / $: asPParser / $# asPParser / #newline asPParser) negate))
				star
]

{ #category : #grammar }
YamlPPGrammar >> singleQuotedString [
	^ ($' asPParser , stringWithinSingleQuotes , $' asPParser) ==> #second
]

{ #category : #accessing }
YamlPPGrammar >> start [
	^ document
]

{ #category : #grammar }
YamlPPGrammar >> stringWithinDoubleQuotes [
	^ (notAnEscapedQuote / ($\ asPParser , #any asPParser)) star flatten
]

{ #category : #grammar }
YamlPPGrammar >> stringWithinSingleQuotes [
	^ ($' asPParser negate / doubledSingleQuotes) star
]

{ #category : #grammar }
YamlPPGrammar >> value [
	^ scalar
]
