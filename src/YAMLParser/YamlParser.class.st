Class {
	#name : #YamlParser,
	#superclass : #SmaCCParser,
	#category : #'YAMLParser-SmaCC'
}

{ #category : #'generated-accessing' }
YamlParser class >> cacheId [
	^'2023-01-09T16:42:53.101465+01:00'
]

{ #category : #generated }
YamlParser class >> definitionComment [
"%unicode;


%root YAML;
%id <INDENT> <DEDENT> ;
<name>
	: \w +
	;
<whitespace>
	: \s *
	;
YAML 
	: Mapping +
	;
Mapping
	: Key 'key' "":"" Value 'value'
	;
Key
	: <name>
	;
Value
	: <name>
	;"
]

{ #category : #generated }
YamlParser class >> reduceTable [
^#(
	#(8 1 #liftFirstValue: 158721 false) 
	#(5 1 #liftFirstValue: 93185 false) 
	#(6 1 #liftFirstValue: 102401 false) 
	#(6 2 #liftFirstValue: 102402 false) 
	#(9 1 #liftFirstValue: 176129 false) 
	#(7 3 #liftFirstValue: 115713 false)
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
	^ #('":"' '<name>' '<whitespace>' 'B e g i n' 'YAML' 'Mapping +' 'Mapping' 'Key' 'Value' '<DEDENT>' '<INDENT>' 'E O F' 'error')
]

{ #category : #generated }
YamlParser class >> symbolTypes [
	^ #(#SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCToken #SmaCCErrorNode)
]

{ #category : #generated }
YamlParser class >> transitionTable [
^#(
#[1 0 25 0 2 0 13 0 5 0 17 0 6 0 17 0 7 0 25 0 8] 
#[0 0 6 0 1] 
#[0 0 0 0 12] 
#[1 0 25 0 2 0 29 0 7 0 25 0 8 0 10 0 12] 
#[0 0 14 0 2 0 12] 
#[0 0 33 0 1] 
#[0 0 18 0 2 0 12] 
#[0 0 41 0 2 0 9] 
#[0 0 22 0 2 0 12] 
#[0 0 26 0 2 0 12]
	).
]
