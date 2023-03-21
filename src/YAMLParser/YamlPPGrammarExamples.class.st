"
These examples only test the grammar, not the result of parsing.
"
Class {
	#name : #YamlPPGrammarExamples,
	#superclass : #PP2CompositeNodeExamples,
	#category : #'YAMLParser-PPExamples'
}

{ #category : #accessing }
YamlPPGrammarExamples >> codeWithComment [
	<gtExample>
	^ self parse: 'foo
# yada yada yada' rule: #document
]

{ #category : #accessing }
YamlPPGrammarExamples >> comment [
	<gtExample>
	| input |
	input := '# yada yada yada'.
	self fail: input rule: #document.
	self parse: input rule: #ignorable.
	^ self parse: input rule: #comment
]

{ #category : #accessing }
YamlPPGrammarExamples >> commentWithCode [
	<gtExample>
	^ self parse: '
# yada yada yada
foo' rule: #document
]

{ #category : #accessing }
YamlPPGrammarExamples >> compactMappingListItem [
	"This is a compact nested mapping mentioned in section 2.2 of the YAML Spec
		https://yaml.org/spec/1.2.2/#22-structures"

	<gtExample>
	^ self parse: '- foo: bar' rule: #listItem
]

{ #category : #accessing }
YamlPPGrammarExamples >> compactMappingListItemContinued [
	"This is a compact mapping list continued with further mappings"

	<gtExample>
	^ self parse: '- foo: bar
  fee : baz' rule: #listItem
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
YamlPPGrammarExamples >> docWithLiteralString [
	<gtExample>
	^ self parse: 
'yaml: |
  ...
' rule: #document
]

{ #category : #accessing }
YamlPPGrammarExamples >> documentStartEnd [
	<gtExample>
	^ self parse: '---
foo
...
' rule: #document
]

{ #category : #accessing }
YamlPPGrammarExamples >> doubleQuotedString [
	<gtExample>
	| input |
	input := '"It is a far far better thing"'.
	self parse: input rule: #value.
	self fail: input rule: #scalar.
	^ self parse: input rule: #doubleQuotedString
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
YamlPPGrammarExamples >> fooBarFlowList [
	<gtExample>
	^ self parse: '[ foo , bar ]' rule: #flowList
]

{ #category : #accessing }
YamlPPGrammarExamples >> fooFlowList [
	<gtExample>
	^ self parse: '[ foo ]' rule: #flowList
]

{ #category : #accessing }
YamlPPGrammarExamples >> fooListItem [
	<gtExample>
	^ self parse: '- foo' rule: #listItem
]

{ #category : #accessing }
YamlPPGrammarExamples >> foobarFeebazFlowMappingList [
	<gtExample>
	^ self parse: '{ foo : bar , fee : baz }' rule: #flowMappingList
]

{ #category : #accessing }
YamlPPGrammarExamples >> foobarFeebazNestedFlowList [
	<gtExample>
	^ self parse: '[ { foo : bar } , [ fee , baz ] ]' rule: #flowList
]

{ #category : #accessing }
YamlPPGrammarExamples >> foobarFeebazNestedFlowMappingList [
	<gtExample>
	^ self parse: '{ foo : bar , fee : [ foobar, baz ] }' rule: #flowMappingList
]

{ #category : #accessing }
YamlPPGrammarExamples >> foobarFlowMappingList [
	<gtExample>
	^ self parse: '{ foo : bar }' rule: #flowMappingList
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
YamlPPGrammarExamples >> literalString [
	<gtExample>
	^ self parse: 
'|
  foo
  bar
' rule: #literalString
]

{ #category : #accessing }
YamlPPGrammarExamples >> mappingWithNullAndNewMapping [
	<gtExample>
	| input |
	input := 'foo:
bar: baz'.
	self parse: input rule: #mapping.
	^ self parse: input rule: #document
]

{ #category : #accessing }
YamlPPGrammarExamples >> mappingWithNullValueAtEOF [
	"Not sure why this is not working. Parsing is continuing after the end of input."

	<gtExample>
	<noTest>
	
	| input |
	input := 'foo:'.
	self parse: input rule: #mapping.
	^ self parse: input rule: #document
]

{ #category : #accessing }
YamlPPGrammarExamples >> nestedListAndMappingList [
	<gtExample>
	^ self parse: '-
  foo : bar
  fee :
    - baz
    - booz'  rule: #list
]

{ #category : #accessing }
YamlPPGrammarExamples >> nestedListWithMappingList [
	<gtExample>
	^ self parse: '-
  foo : bar
  fee : baz'  rule: #list
]

{ #category : #accessing }
YamlPPGrammarExamples >> nestedMappingList [
	<gtExample>
	^ self parse: 'foo :
  bar : foobar
  baz : foobaz
bar : foo'  rule: #mappingList
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
YamlPPGrammarExamples >> nestedMappingListWithList [
	<gtExample>
	^ self parse: 'foo :
  - bar
  - baz'  rule: #mappingList
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
	^ self parse: 'foo : bar
foobar : baz' rule: #mappingList
]

{ #category : #accessing }
YamlPPGrammarExamples >> simpleNestedList [
	<gtExample>
	^ self parse: self simpleNestedListCode  rule: #list
]

{ #category : #accessing }
YamlPPGrammarExamples >> simpleNestedListCode [
	<gtExample>
	^ '- 
  - foo
  - bar
'
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

{ #category : #accessing }
YamlPPGrammarExamples >> variable [
	<gtExample>
	| input |
	input := '{{ foo }}'.
	self parse: input rule: #value.
	self fail: input rule: #scalar.
	^ self parse: input rule: #variable
]

{ #category : #accessing }
YamlPPGrammarExamples >> variableWithinScalar [
	<gtExample>
	| input |
	input := 'Something ${{ foo }}'.
	self parse: input rule: #value.
	self parse: input rule: #scalar.
	^ self fail: input rule: #variable
]
