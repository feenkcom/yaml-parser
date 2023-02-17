Class {
	#name : #IndentationTransformerNodeExamples,
	#superclass : #PP2CompositeNodeExamples,
	#category : #'YAMLParser-PPExamples'
}

{ #category : #accessing }
IndentationTransformerNodeExamples >> foo [
	<gtExample>
	| result |
	result := self parse: 'foo'.
	^ result
]

{ #category : #accessing }
IndentationTransformerNodeExamples >> indentOnce [
	<gtExample>
	| result |
	result := self parse: String space , String space rule: #indent.
	^ result
]

{ #category : #accessing }
IndentationTransformerNodeExamples >> parserClass [
	^ IndentationTransformer
]
