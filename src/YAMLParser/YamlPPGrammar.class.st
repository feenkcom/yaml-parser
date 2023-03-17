Class {
	#name : #YamlPPGrammar,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'number',
		'scalar',
		'value',
		'key',
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
		'indentedList',
		'flowList',
		'flowMappingList',
		'variable',
		'listItemValue',
		'ignorable',
		'indentedValue',
		'unindentedValue'
	],
	#category : #'YAMLParser-PParser'
}

{ #category : #accessing }
YamlPPGrammar class >> ignoredNames [
	^ super ignoredNames copyWithAll: #(indentToken dedentToken parseTransformed:)
]

{ #category : #accessing }
YamlPPGrammar class >> parseTransformed: aString [
	^ self parse: (IndentationTransformer transform: aString)
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
	^ ($0 asPParser not , #digit asPParser plus token) ==> #second
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
	^ (newline star / ignorable) , (list / mappingList / value) end
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
YamlPPGrammar >> flowList [
	^ ($[ asPParser trim: ignorable) , value
		, (($, asPParser trim: ignorable) , value) star
		, ($] asPParser trim: ignorable)
]

{ #category : #grammar }
YamlPPGrammar >> flowMappingList [
	^ (${ asPParser trim: ignorable) , mapping
		, (($, asPParser trim: ignorable) , mapping) star
		, ($} asPParser trim: ignorable)
]

{ #category : #grammar }
YamlPPGrammar >> ignorable [
	"Newlines are special"

	"^ (comment / #space asPParser) star"

	^ (comment / Character space asPParser) star
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
YamlPPGrammar >> indentedList [
	^ indent , list , dedent
]

{ #category : #grammar }
YamlPPGrammar >> indentedMappingList [
	^ indent , mappingList , dedent
]

{ #category : #grammar }
YamlPPGrammar >> indentedValue [
	^ indentedList / indentedMappingList
]

{ #category : #grammar }
YamlPPGrammar >> initialScalarStringChars [
	"Taken from the ANTLR Scanner
	https://github.com/umaranis/FastYaml/blob/master/src/antlr/YamlLexer.g4
	fragment STRING_MY_START
	"

	^ ( $- asPParser / #blank asPParser / #newline asPParser / $: asPParser
		/ $# asPParser / ${ asPParser / $[ asPParser / $& asPParser / $* asPParser)
		negate 
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
	^ ($- asPParser trim: ignorable), newline optional, listItemValue 
]

{ #category : #grammar }
YamlPPGrammar >> listItemValue [
	^ (mapping , newline star , indentedMappingList star) / value
]

{ #category : #grammar }
YamlPPGrammar >> mapping [
	"We are tolerant of an extra space before a key.
	Apparently a missing value is equivalent to null, so we match newline and (not consuming the NL)."

	^ #space asPParser optional , key , ($: asPParser trim: ignorable)
		, (#endOfInput asPParser 
		/ newline and, indentedValue
		/ unindentedValue)
]

{ #category : #grammar }
YamlPPGrammar >> mappingList [
	^ mapping , (newline / mapping) star
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
	^ (number / scalarString) trim: ignorable
]

{ #category : #grammar }
YamlPPGrammar >> scalarString [
	"Taken from the ANTLR Scanner
	https://github.com/umaranis/FastYaml/blob/master/src/antlr/YamlLexer.g4
	STRING_MY
	Adapted to fail when encountering #{... after the first char.
	Also forbidding flow chars {}[] within string values for now.
	"

	^ (initialScalarStringChars, 
			( ($# asPParser , ${ asPParser not)
			/ variable
			/
				( $# asPParser 
				/ #blank asPParser 
				/ #newline asPParser 
				/ $" asPParser
				/ $: asPParser
				/ ${ asPParser
				/ $} asPParser
				/ $[ asPParser
				/ $] asPParser
				) negate
			/ ($: asPParser , (#blank asPParser / #newline asPParser) negate)
			/ (#blank asPParser plus
				,	( #blank asPParser 
					/ $: asPParser 
					/ $# asPParser 
					/ #newline asPParser
					/ $, asPParser 
					/ ${ asPParser
					/ $} asPParser
					/ $[ asPParser
					/ $] asPParser
					) negate)
			) star) token
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
	^ (notAnEscapedQuote / ($\ asPParser , #any asPParser)) star token
]

{ #category : #grammar }
YamlPPGrammar >> stringWithinSingleQuotes [
	^ ($' asPParser negate / doubledSingleQuotes) star token
]

{ #category : #grammar }
YamlPPGrammar >> unindentedValue [
	^ flowList / variable / flowMappingList / doubleQuotedString / scalar
]

{ #category : #grammar }
YamlPPGrammar >> value [
	"We add the {{..}} variable rule before the { key : val, ...} flowMappingList rule"

	<todo: 'Add string literals'>
	^ unindentedValue / indentedValue
]

{ #category : #grammar }
YamlPPGrammar >> variable [
	"This is used, for example, in Ansible, though it does not appear in the YAML spec"

	^ '{{' asPParser , $} asPParser negate star token , '}}' asPParser
]
