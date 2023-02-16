Class {
	#name : #IndentationTransformerExamples,
	#superclass : #Object,
	#category : #'YAMLParser-PPExamples'
}

{ #category : #accessing }
IndentationTransformerExamples >> foo [
	<gtExample>
	| result |
	result := self transform: 'foo'.
	self assert: result equals: 'foo'.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> fooIndentBar [
	<gtExample>
	| result |
	result := self
			transform: 'foo
  bar'.
	self
		assert: result
		equals: 'foo
<<INDENT>>bar<<DEDENT>>'.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> fooIndentBarCR [
	<gtExample>
	| result |
	result := self
			transform: 'foo
  bar
'.
	self
		assert: result
		equals: 'foo
<<INDENT>>bar
<<DEDENT>>'.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> fooIndentBarDedentFoobar [
	<gtExample>
	| result |
	result := self
			transform: 'foo
  bar
foobar'.
	self
		assert: result
		equals: 'foo
<<INDENT>>bar
<<DEDENT>>foobar'.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> fooIndentBarDedentFoobarCR [
	<gtExample>
	| result |
	result := self
			transform: 'foo
  bar
foobar
'.
	self
		assert: result
		equals: 'foo
<<INDENT>>bar
<<DEDENT>>foobar
'.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> parse: aString [
	^ IndentationTransformer new parse: aString
]

{ #category : #accessing }
IndentationTransformerExamples >> transform: aString [
	^ IndentationTransformer transform: aString
]

{ #category : #accessing }
IndentationTransformerExamples >> x [
	<gtExample>
	| result |
	result := self transform: 'x'.
	self assert: result equals: 'x'.
	^ result
]
