Class {
	#name : #YAMLParserExamples,
	#superclass : #Object,
	#category : #'YAMLParser-Examples'
}

{ #category : #'code examples' }
YAMLParserExamples >> nestedMappingList [
	"NB: two spaces correspond to an indentation. Tabs are not allowed."

	<gtExample>
	^ 'foo :
  foobar : baz'
]

{ #category : #example }
YAMLParserExamples >> nestedMappingListAST [
	"We need to test that the sublist is actually nested."

	<gtExample>
	| node |
	node := self nestedMappingListParse.

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

{ #category : #example }
YAMLParserExamples >> nestedMappingListParse [
	"We need to test that the sublist is actually nested."

	<gtExample>
	| node |
	node := self parse: self nestedMappingList.
	^ node
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
YAMLParserExamples >> simpleList [
	<gtExample>
	^ '- foo
- bar'
]

{ #category : #'code examples' }
YAMLParserExamples >> simpleListAST [
	<gtExample>
	| node |
	node := self simpleListParse.
	self assert: node document listItems size equals: 2.
	self assert: node document listItems first value ident value equals: 'foo'.
	self assert: node document listItems second value ident value equals: 'bar'.
	^ node
]

{ #category : #'code examples' }
YAMLParserExamples >> simpleListParse [
	<gtExample>
	| node |
	node := self parse: self simpleList.
	^ node
]

{ #category : #'code examples' }
YAMLParserExamples >> simpleMappingList [
	<gtExample>
	^ 'foo : bar
foobar : baz'
]

{ #category : #example }
YAMLParserExamples >> simpleMappingListAST [
	<gtExample>
	| node |
	node := self simpleMappingListParse.
	self assert: node document mappings size equals: 2.
	self assert: node document mappings first key ident value equals: 'foo'.
	self assert: node document mappings first value ident value equals: 'bar'.
	^ node
]

{ #category : #example }
YAMLParserExamples >> simpleMappingListParse [
	<gtExample>
	| node |
	node := self parse: self simpleMappingList.
	^ node
]

{ #category : #'code examples' }
YAMLParserExamples >> simpleNestedList [
	<gtExample>
	^ '-
  - foo
  - bar
- bar'
]

{ #category : #'code examples' }
YAMLParserExamples >> simpleNestedListParse [
	<gtExample>
	| node |
	node := self parse: self simpleNestedList.
	^ node
]
