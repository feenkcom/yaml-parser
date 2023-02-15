Class {
	#name : #IndentationTransformerExamples,
	#superclass : #Object,
	#category : #'YAMLParser-PPExamples'
}

{ #category : #accessing }
IndentationTransformerExamples >> foo [
	<gtExample>
	| result |
	result := '' join: (self parse: 'foo').
	self assert: result equals: 'foo'.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> fooIndentBar [
	<gtExample>
	| result |
	result := '' join: (self parse: 'foo
  bar').
	self assert: result equals: 'foo
<<INDENT>>bar<<DEDENT>>'.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> fooIndentBarCR [
	<gtExample>
	| result |
	result := '' join: (self parse: 'foo
  bar
').
	self assert: result equals: 'foo
<<INDENT>>bar
<<DEDENT>>'.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> fooIndentBarDedentFoobar [
	<gtExample>
	| result |
	result := '' join: (self parse: 'foo
  bar
foobar').
	self assert: result equals: 'foo
<<INDENT>>bar
<<DEDENT>>foobar'.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> fooIndentBarDedentFoobarCR [
	<gtExample>
	| result |
	result := '' join: (self parse: 'foo
  bar
foobar
').
	self assert: result equals: 'foo
<<INDENT>>bar
<<DEDENT>>foobar
'.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> parse: aString [
	^ IndentationTransformer new end parse: aString
]
