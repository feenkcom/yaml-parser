Class {
	#name : #YamlPParserExamples,
	#superclass : #PP2CompositeNodeExamples,
	#category : #'YAMLParser-PPExamples'
}

{ #category : #accessing }
YamlPParserExamples >> nestedMappingList [
	<gtExample>
	^ self parse: self nestedMappingListCode
]

{ #category : #accessing }
YamlPParserExamples >> nestedMappingListCode [
	<gtExample>
	^ 'foo :
  bar : foobar
  baz : foobaz
bar : foo'
]

{ #category : #accessing }
YamlPParserExamples >> newline [
	<gtExample>
	^ self parse: String cr rule: #newline
]

{ #category : #accessing }
YamlPParserExamples >> parse: aString [
	^ super parse: (IndentationTransformer transform: aString)
]

{ #category : #accessing }
YamlPParserExamples >> parserClass [
	^ YamlPParser
]

{ #category : #accessing }
YamlPParserExamples >> simpleMappingList [
	<gtExample>
	^ self parse: self simpleMappingListCode
]

{ #category : #accessing }
YamlPParserExamples >> simpleMappingListCode [
	<gtExample>
	^ 'foo : bar
foobar : baz'
]
