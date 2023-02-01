Class {
	#name : #MappingPParserExamples,
	#superclass : #Object,
	#category : #'YAMLParser-Examples'
}

{ #category : #accessing }
MappingPParserExamples >> parse: aString [ 
	^ MappingPParser parse: aString
]

{ #category : #accessing }
MappingPParserExamples >> simpleMappingList [
	<gtExample>
	^ self parse: self simpleMappingListCode
]

{ #category : #accessing }
MappingPParserExamples >> simpleMappingListCode [
	<gtExample>
	^ 'foo : bar
foobar : baz'
]
