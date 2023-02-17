Class {
	#name : #YamlPParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'name',
		'number',
		'scalar',
		'value',
		'key',
		'mappingValue',
		'mapping',
		'newline',
		'indent',
		'dedent',
		'mappingList',
		'indentedMappingList',
		'document',
		'integer'
	],
	#category : #'YAMLParser-PParser'
}

{ #category : #grammar }
YamlPParser >> dedent [
	^ '<<DEDENT>>' asPParser
]

{ #category : #grammar }
YamlPParser >> document [
	^ (mappingList / value) end
]

{ #category : #grammar }
YamlPParser >> indent [
	^ '<<INDENT>>' asPParser
]

{ #category : #grammar }
YamlPParser >> indentedMappingList [
	^ indent , mappingList , dedent
]

{ #category : #grammar }
YamlPParser >> integer [
	^ #digit asPParser plus flatten
]

{ #category : #grammar }
YamlPParser >> key [
	^ name
]

{ #category : #grammar }
YamlPParser >> mapping [
	^ key , $: asPParser trim , mappingValue
]

{ #category : #grammar }
YamlPParser >> mappingList [
	^ mapping , (newline / mapping) star
]

{ #category : #grammar }
YamlPParser >> mappingValue [
	^ indentedMappingList / value
]

{ #category : #grammar }
YamlPParser >> name [
	^ (#letter asPParser / $_ asPParser , (#word asPParser / $_ asPParser) star)
		flatten
]

{ #category : #grammar }
YamlPParser >> newline [
	^ #newline asPParser
]

{ #category : #grammar }
YamlPParser >> number [
	^ integer
]

{ #category : #grammar }
YamlPParser >> scalar [
	^ name / number
]

{ #category : #accessing }
YamlPParser >> start [
	^ document
]

{ #category : #grammar }
YamlPParser >> value [
	^ scalar
]
