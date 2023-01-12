Class {
	#name : #YAMLParserExamples,
	#superclass : #Object,
	#category : #'YAMLParser-Examples'
}

{ #category : #'code examples' }
YAMLParserExamples >> nestedList [
	"NB: two spaces correspond to an indentation. Tabs are not allowed."

	<gtExample>
	^ 'foo :
  foobar : baz'
]

{ #category : #example }
YAMLParserExamples >> nestedListParse [
"We need to test that the sublist is actually nested."
	<gtExample>
	| node |
	node := self parse: self nestedList.
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
	^ 'foo : bar
foobar : baz'
]

{ #category : #example }
YAMLParserExamples >> simpleListAST [
	<gtExample>
	| node |
	node := self simpleListParse.

	self assert: node document mappings size equals: 2.
	self assert: node document mappings first key ident value equals: 'foo'.
	self assert: node document mappings first value ident value equals: 'bar'.
	^ node
]

{ #category : #example }
YAMLParserExamples >> simpleListParse [
	<gtExample>
	| node |
	node := self parse: self simpleList.
	^ node
]
