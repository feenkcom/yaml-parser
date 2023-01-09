Class {
	#name : #YamlParser,
	#superclass : #SmaCCParser,
	#category : #'YAMLParser-SmaCC'
}

{ #category : #'generated-accessing' }
YamlParser class >> cacheId [
	^'2022-11-22T15:11:46.710049+01:00'
]

{ #category : #generated }
YamlParser class >> definitionComment [
"%unicode;


%root YAML;<key>
	: \w +
	;
<value>
	: \w +
	;
YAML 
	: Mapping +
	;
Mapping
	: <key> "":"" <value>
	;"
]

{ #category : #generated }
YamlParser class >> reduceTable [
^#(
	#(5 1 #liftFirstValue: 61441 false) 
	#(6 1 #liftFirstValue: 70657 false) 
	#(6 2 #liftFirstValue: 70658 false) 
	#(7 3 #liftFirstValue: 83969 false)
	).
]

{ #category : #generated }
YamlParser class >> scannerClass [
	^YamlScanner
]

{ #category : #generated }
YamlParser class >> startingStateForYAML [
	^ 1
]

{ #category : #generated }
YamlParser class >> symbolNames [
	^ #('":"' '<key>' '<value>' 'B e g i n' 'YAML' 'Mapping +' 'Mapping' 'E O F' 'error')
]

{ #category : #generated }
YamlParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
YamlParser class >> transitionTable [
^#(
#[1 0 9 0 2 0 13 0 5 0 17 0 6 0 17 0 7] 
#[0 0 25 0 1] 
#[0 0 0 0 8] 
#[1 0 9 0 2 0 29 0 7 0 6 0 8] 
#[0 0 10 0 2 0 8] 
#[0 0 33 0 3] 
#[0 0 14 0 2 0 8] 
#[0 0 18 0 2 0 8]
	).
]
