Class {
	#name : #IndentationTransformerExamples,
	#superclass : #PP2CompositeNodeExamples,
	#category : #'YAMLParser-PPExamples'
}

{ #category : #accessing }
IndentationTransformerExamples >> foo [
	<gtExample>
	| result |
	result := ''
			join: (self
					parse: 'foo'
					rule: #transformIndents).
	self
		assert: result
		equals: 'foo'.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> fooIndentBar [
	<gtExample>
	| result |
	result := ''
			join: (self
					parse: 'foo
  bar'
					rule: #transformIndents).
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
	result := ''
			join: (self
					parse: 'foo
  bar
'
					rule: #transformIndents).
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
	result := ''
			join: (self
					parse: 'foo
  bar
foobar'
					rule: #transformIndents).
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
	result := ''
			join: (self
					parse: 'foo
  bar
foobar
'
					rule: #transformIndents).
	self
		assert: result
		equals: 'foo
<<INDENT>>bar
<<DEDENT>>foobar
'.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> indentOnce [
	<gtExample>
	| result |
	result := self parse: String space , String space rule: #indent.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> indentString [
	^ String space , String space
]

{ #category : #accessing }
IndentationTransformerExamples >> indentTwice [
	<gtExample>
	| result |
	result := self parse: (self indentString repeat: 2) rule: #indents.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> indentedFoo [
	<gtExample>
	| result |
	result := self parse: '  foo' rule: #indentedLine.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> newline [
	<gtExample>
	| result |
	result := self parse: String cr rule: #newline.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> nonIndentedFoo [
	<gtExample>
	| result |
	result := self parse: 'foo' rule: #nonIndentedLine.
	^ result
]

{ #category : #accessing }
IndentationTransformerExamples >> parserClass [
	^ IndentationTransformer
]

{ #category : #accessing }
IndentationTransformerExamples >> x [
	<gtExample>
	| result |
	result := ''
			join: (self
					parse: 'x'
					rule: #transformIndents).
	self
		assert: result
		equals: 'x'.
	^ result
]
