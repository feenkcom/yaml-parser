Class {
	#name : #IndentationPParserExamples,
	#superclass : #Object,
	#category : #'YAMLParser-Examples'
}

{ #category : #accessing }
IndentationPParserExamples >> fooBar [
	<gtExample>
	| result |
	result := self parse: self fooBarString.
	self assert: result size equals: 3.
	self assert: result keys equals: #(foo foo2 bar2).
	self assert: (result at: 'foo') size equals: 2.
	self assert: (result at: 'foo2') size equals: 0.
	self assert: (result at: 'bar2') size equals: 0.
	^ result
]

{ #category : #accessing }
IndentationPParserExamples >> fooBarString [
	<gtExample>
	^ 'foo
  bar
    baz
  foobar
foo2
bar2'
]

{ #category : #accessing }
IndentationPParserExamples >> parse: aString [
	^ IndentationPParser parse: aString
]
