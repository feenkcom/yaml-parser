Class {
	#name : #YamlPParserExamples,
	#superclass : #Object,
	#category : #'YAMLParser-PPExamples'
}

{ #category : #accessing }
YamlPParserExamples >> nestedMappingListCode [
	<gtExample>
	^ 'foo :
  bar : foobar
  baz : foobaz
bar : foo'
]

{ #category : #accessing }
YamlPParserExamples >> parse: aString [ 
	^ MappingPParser parse: aString
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
