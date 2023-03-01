"
These examples only test the grammar, not the result of parsing.
"
Class {
	#name : #YamlPPGrammarExamples,
	#superclass : #PP2CompositeNodeExamples,
	#category : #'YAMLParser-PPExamples'
}

{ #category : #accessing }
YamlPPGrammarExamples >> comment [
	<gtExample>
	^ self parse: '# yada yada yada' rule: #comment
]

{ #category : #accessing }
YamlPPGrammarExamples >> decimalInteger [
	<gtExample>
	^ self parse: '1234' rule: #decimalInteger
]

{ #category : #accessing }
YamlPPGrammarExamples >> decimalIntegerAsNumber [
	<gtExample>
	^ self parse: '1234' rule: #number
]

{ #category : #accessing }
YamlPPGrammarExamples >> decimalIntegerAsScalar [
	<gtExample>
	^ self parse: '1234' rule: #scalar
]

{ #category : #accessing }
YamlPPGrammarExamples >> dedentToken [
	<gtExample>
	self fail: '#{DEDENT}#' rule: #comment.
	self fail: '#{DEDENT}#' rule: #value.
	^ self parse: '#{DEDENT}#' rule: #dedent
]

{ #category : #accessing }
YamlPPGrammarExamples >> doubleQuotedString [
	<gtExample>
	^ self parse: '"It is a far far better thing"' rule: #doubleQuotedString
]

{ #category : #accessing }
YamlPPGrammarExamples >> doubleQuotedStringWithEscapes [
	<gtExample>
	^ self parse: '"This \string has'' \'' funny \\ \" escapes"' rule: #doubleQuotedString
]

{ #category : #accessing }
YamlPPGrammarExamples >> embeddedHashValue [
	"A hash in the middle of a scalar is not a comment"

	<gtExample>
	self fail: 'foo#bar' rule: #comment.
	^ self parse: 'foo#bar' rule: #value
]

{ #category : #accessing }
YamlPPGrammarExamples >> indentNotComment [
	<gtExample>
	^ self fail: '#{INDENT}#' rule: #comment
]

{ #category : #accessing }
YamlPPGrammarExamples >> indentedMappingList [
	<gtExample>
	^ self parse: '#{INDENT}#bar : baz#{DEDENT}#' rule: #indentedMappingList
]

{ #category : #accessing }
YamlPPGrammarExamples >> nestedMappingList [
	<gtExample>
	^ self parse: self nestedMappingListCode  rule: #mappingList
]

{ #category : #accessing }
YamlPPGrammarExamples >> nestedMappingListCode [
	<gtExample>
	^ 'foo :
  bar : foobar
  baz : foobaz
bar : foo'
]

{ #category : #accessing }
YamlPPGrammarExamples >> nestedMappingListCodeTiny [

	<gtExample>
	^ 'foo :
  bar : baz'

]

{ #category : #accessing }
YamlPPGrammarExamples >> nestedMappingListTiny [
	<gtExample>
	^ self parse: self nestedMappingListCodeTiny  rule: #mappingList
]

{ #category : #accessing }
YamlPPGrammarExamples >> newline [
	<gtExample>
	^ self parse: String cr rule: #newline
]

{ #category : #accessing }
YamlPPGrammarExamples >> noDedentInValue [
	"Parsing ofthe value should stop at baz"

	<gtExample>
	^ self fail: 'baz#{DEDENT}#' rule: #value
]

{ #category : #accessing }
YamlPPGrammarExamples >> parse: aString rule: aSymbol [
	^ super parse: (IndentationTransformer transform: aString) rule: aSymbol
]

{ #category : #accessing }
YamlPPGrammarExamples >> parserClass [
	^ YamlPPGrammar
]

{ #category : #accessing }
YamlPPGrammarExamples >> scalarStringFoo [
	<gtExample>
	^ self parse: 'foo' rule: #scalarString
]

{ #category : #accessing }
YamlPPGrammarExamples >> scalarStringFooBarWithColon [
	<gtExample>
	^ self parse: 'foo:bar' rule: #scalarString
]

{ #category : #accessing }
YamlPPGrammarExamples >> scalarStringFooBarWithSpaces [
	<gtExample>
	^ self parse: 'foo bar' rule: #scalarString
]

{ #category : #accessing }
YamlPPGrammarExamples >> simpleMappingList [
	<gtExample>
	^ self parse: self simpleMappingListCode rule: #mappingList
]

{ #category : #accessing }
YamlPPGrammarExamples >> simpleMappingListCode [
	<gtExample>
	^ 'foo : bar
foobar : baz'
]

{ #category : #accessing }
YamlPPGrammarExamples >> singleQuotedString [
	<gtExample>
	^ self parse: '''It is a far far better thing''' rule: #singleQuotedString
]

{ #category : #accessing }
YamlPPGrammarExamples >> singleQuotedStringWithDoubledSingleQuotes [
	<gtExample>
	^ self parse: '''It is a ''''far'''' ''''far'''' better thing''' rule: #singleQuotedString
]

{ #category : #accessing }
YamlPPGrammarExamples >> spaceInValue [
	<gtExample>
	^ self parse: 'foo bar' rule: #value
]
