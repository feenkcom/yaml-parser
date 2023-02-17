"
These examples only test the grammar, not the result of parsing.
"
Class {
	#name : #YamlPParserExamples,
	#superclass : #PP2CompositeNodeExamples,
	#category : #'YAMLParser-PPExamples'
}

{ #category : #accessing }
YamlPParserExamples >> comment [
	<gtExample>
	^ self parse: '# yada yada yada' rule: #comment
]

{ #category : #accessing }
YamlPParserExamples >> decimalInteger [
	<gtExample>
	^ self parse: '1234' rule: #decimalInteger
]

{ #category : #accessing }
YamlPParserExamples >> decimalIntegerAsNumber [
	<gtExample>
	^ self parse: '1234' rule: #number
]

{ #category : #accessing }
YamlPParserExamples >> decimalIntegerAsScalar [
	<gtExample>
	^ self parse: '1234' rule: #scalar
]

{ #category : #accessing }
YamlPParserExamples >> doubleQuotedString [
	<gtExample>
	^ self parse: '"It is a far far better thing"' rule: #doubleQuotedString
]

{ #category : #accessing }
YamlPParserExamples >> doubleQuotedStringWithEscapes [
	<gtExample>
	^ self parse: '"This \string has'' \'' funny \\ \" escapes"' rule: #doubleQuotedString
]

{ #category : #accessing }
YamlPParserExamples >> nestedMappingList [
	<gtExample>
	^ self parse: self nestedMappingListCode  rule: #mappingList
]

{ #category : #accessing }
YamlPParserExamples >> nestedMappingListCode [
	<gtExample>
	^ 'foo :
  bar : foobar
  baz : foobaz
bar : foo'
]

{ #category : #accessing }
YamlPParserExamples >> newline [
	<gtExample>
	^ self parse: String cr rule: #newline
]

{ #category : #accessing }
YamlPParserExamples >> parse: aString [
	^ super parse: (IndentationTransformer transform: aString)
]

{ #category : #accessing }
YamlPParserExamples >> parse: aString rule: aSymbol [
	^ super parse: (IndentationTransformer transform: aString) rule: aSymbol
]

{ #category : #accessing }
YamlPParserExamples >> parserClass [
	^ YamlPParser
]

{ #category : #accessing }
YamlPParserExamples >> simpleMappingList [
	<gtExample>
	^ self parse: self simpleMappingListCode rule: #mappingList
]

{ #category : #accessing }
YamlPParserExamples >> simpleMappingListCode [
	<gtExample>
	^ 'foo : bar
foobar : baz'
]

{ #category : #accessing }
YamlPParserExamples >> singleQuotedString [
	<gtExample>
	^ self parse: '''It is a far far better thing''' rule: #singleQuotedString
]

{ #category : #accessing }
YamlPParserExamples >> singleQuotedStringWithDoubledSingleQuotes [
	<gtExample>
	^ self parse: '''It is a ''''far'''' ''''far'''' better thing''' rule: #singleQuotedString
]
