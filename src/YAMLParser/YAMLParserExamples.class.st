Class {
	#name : #YAMLParserExamples,
	#superclass : #Object,
	#category : #'YAMLParser-SmaCC-Examples'
}

{ #category : #example }
YAMLParserExamples >> nestedMappingListAST [
	"We need to test that the sublist is actually nested."

	<gtExample>
	| node |
	node := self parse: self nestedMappingListCode.

	self assert: node document mappings size equals: 1.
	self assert: node document mappings first key ident value equals: 'foo'.
	self
		assert: node document mappings first mappingList mappings first key ident value
		equals: 'foobar'.
	self
		assert: node document mappings first mappingList mappings first value ident value
		equals: 'baz'.

	^ node
]

{ #category : #'code examples' }
YAMLParserExamples >> nestedMappingListCode [
	"NB: two spaces correspond to an indentation. Tabs are not allowed."

	<gtExample>
	^ 'foo :
  foobar : baz'
]

{ #category : #'examples-support' }
YAMLParserExamples >> parse: aString [
	| aResult |
	aResult := self parser parse: aString.
	self assert: aResult isNotNil.
	^ aResult
]

{ #category : #'examples-support' }
YAMLParserExamples >> parser [
	^ YAMLParser
]

{ #category : #'code examples' }
YAMLParserExamples >> simpleListAST [
	<gtExample>
	| node |
	node := self parse: self simpleListCode.
	self assert: node document listItems size equals: 2.
	self assert: node document listItems first value ident value equals: 'foo'.
	self assert: node document listItems second value ident value equals: 'bar'.
	^ node
]

{ #category : #'code examples' }
YAMLParserExamples >> simpleListCode [
	<gtExample>
	^ '- foo
- bar'
]

{ #category : #example }
YAMLParserExamples >> simpleMappingListAST [
	<gtExample>
	| node |
	node := self parse: self simpleMappingListCode.
	self assert: node document mappings size equals: 2.
	self assert: node document mappings first key ident value equals: 'foo'.
	self assert: node document mappings first value ident value equals: 'bar'.
	^ node
]

{ #category : #'code examples' }
YAMLParserExamples >> simpleMappingListCode [
	<gtExample>
	^ 'foo : bar
foobar : baz'
]

{ #category : #'code examples' }
YAMLParserExamples >> simpleNestedListAST [
	<gtExample>
	| node |
	node := self parse: self simpleNestedListCode.
	^ node
]

{ #category : #'code examples' }
YAMLParserExamples >> simpleNestedListCode [
	<gtExample>
	^ '-
  - foo
  - bar
- bar'
]
