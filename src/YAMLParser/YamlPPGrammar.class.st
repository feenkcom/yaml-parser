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
		'unindentedValue',
		'file',
		'ignorable2',
		'literalString'
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
	"Consume everything up to the end of line, but not the newline itself.
	NB: ${ hack to not recognize #{INDENT}# or #{DEDENT}# as comments.
	See: YamlPPGrammarExamples>>#indentNotComment 
	"

	<todo: 'What do we do with comments? Discard them?'>
	^ $# asPParser , ${ asPParser not , #endOfLine asPParser negate plus
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
	"NB: flowList and flowMappingList are included in value."
	
	^ ('---' asPParser trim: ignorable) optional , 
		(list 
		/ mappingList 
		/ value),
	('...' asPParser trim: ignorable) optional
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
YamlPPGrammar >> file [
	^ document star end
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
	"Normally we don't care about newlines, so we consume them here with the #space parser.
	Despite what is said in the comment of PP2Node>>#trim:, we need a star here."

	^ (comment / #space asPParser) star
]

{ #category : #grammar }
YamlPPGrammar >> ignorable2 [
	"In cases where we must not consume a newline (mapping), we use this instead."

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
	^ scalarString trim: ignorable
]

{ #category : #grammar }
YamlPPGrammar >> list [
	^ listItem , listItem star
]

{ #category : #grammar }
YamlPPGrammar >> listItem [
	^ ($- asPParser trim: ignorable) , listItemValue
]

{ #category : #grammar }
YamlPPGrammar >> listItemValue [
	^ (mapping , indentedMappingList star) / value
]

{ #category : #grammar }
YamlPPGrammar >> literalString [
	^ ($| asPParser , newline , indent , (scalarString , newline) star , dedent)
		==> #fourth
]

{ #category : #grammar }
YamlPPGrammar >> mapping [
	"Apparently a missing value is equivalent to null.
	We use ignorable2 to *not* consume any newline.
	An end of input or an unindentValue after a newline signal a null value."

	^ key , ($: asPParser trim: ignorable2) ,
		( #endOfInput asPParser
		/ newline , 
			( indentedValue 
			/ mapping )
		/ unindentedValue)
]

{ #category : #grammar }
YamlPPGrammar >> mappingList [
	^ mapping , mapping star
]

{ #category : #grammar }
YamlPPGrammar >> newline [
	<todo: 'Remove this? We don''t need this anymore, it seems.'>
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
	^ file
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
	^ flowList / variable / flowMappingList / doubleQuotedString / literalString
		/ scalar
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
