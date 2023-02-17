Class {
	#name : #YamlPParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'name',
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
		'singleQuotedString'
	],
	#category : #'YAMLParser-PParser'
}

{ #category : #grammar }
YamlPParser >> comment [
	<todo: 'What do we do with comments?'>
	^ $# asPParser , #newline asPParser negate plus
]

{ #category : #grammar }
YamlPParser >> decimalInteger [
	<todo: 'Convert to a number'>
	^ ($0 asPParser not , #digit asPParser plus) ==> #second
]

{ #category : #grammar }
YamlPParser >> dedent [
	^ '<<DEDENT>>' asPParser
]

{ #category : #grammar }
YamlPParser >> document [
	^ (mappingList / value) end
]

{ #category : #grammar }
YamlPParser >> doubleQuotedString [
	<todo: 'Process escape sequences?'>
	^ ($" asPParser , stringWithinDoubleQuotes , $" asPParser) ==> #second
]

{ #category : #grammar }
YamlPParser >> doubledSingleQuotes [
	^ ($' asPParser , $' asPParser) ==> #first
]

{ #category : #grammar }
YamlPParser >> indent [
	^ '<<INDENT>>' asPParser
]

{ #category : #grammar }
YamlPParser >> indentedMappingList [
	^ indent , mappingList , dedent
]

{ #category : #grammar }
YamlPParser >> integer [
	<todo: 'Add octal, hex and binary integers.'>
	^ decimalInteger
]

{ #category : #grammar }
YamlPParser >> key [
	^ name
]

{ #category : #grammar }
YamlPParser >> mapping [
	^ key , $: asPParser trim , mappingValue
]

{ #category : #grammar }
YamlPParser >> mappingList [
	^ mapping , (newline / mapping) star
]

{ #category : #grammar }
YamlPParser >> mappingValue [
	^ indentedMappingList / value
]

{ #category : #grammar }
YamlPParser >> name [
	^ (#letter asPParser / $_ asPParser , (#word asPParser / $_ asPParser) star)
		flatten
]

{ #category : #grammar }
YamlPParser >> newline [
	^ #newline asPParser
]

{ #category : #grammar }
YamlPParser >> notAnEscapedQuote [
	^ ($\ asPParser / $" asPParser) negate
]

{ #category : #grammar }
YamlPParser >> number [
	<todo: 'Add floats and imaginary numbers'>
	^ integer
]

{ #category : #grammar }
YamlPParser >> scalar [
	^ name / number
]

{ #category : #grammar }
YamlPParser >> singleQuotedString [
	^ ($' asPParser , stringWithinSingleQuotes , $' asPParser) ==> #second
]

{ #category : #accessing }
YamlPParser >> start [
	^ document
]

{ #category : #grammar }
YamlPParser >> stringWithinDoubleQuotes [
	^ (notAnEscapedQuote / ($\ asPParser , #any asPParser)) star flatten
]

{ #category : #grammar }
YamlPParser >> stringWithinSingleQuotes [
	^ ($' asPParser negate / doubledSingleQuotes) star
]

{ #category : #grammar }
YamlPParser >> value [
	^ scalar
]
