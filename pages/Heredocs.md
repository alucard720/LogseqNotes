## Heredocs
Son bloques de código que usan la redirección para alimentar un conjunto de líneas o comandos a un
programa externo.
Se usa fundamentalmente para insertar ficheros externos o de configuración en el propio del script
<<IDENTIFICADOR HEREDOC
IDENTIF CADOR_ HEREDOC
Ventajas: se puede transmitir grandes cadenas de una forma sencilla, respetando la identación, espacios
saltos de línea, caracteres especiales, etc.
- ![Grafica Comandos habituales P2](/home/mubuntu/Downloads/comandos habitualesP2.png)
- ![](/home/mubuntu/Downloads/comandoshabitualesP3.png)
- ![Metacaracteres](/home/mubuntu/Downloads/comandoshabitualesP4.png)
-
- ## Expansión
  Se conoce como brace expansion. En este caso, se utilizan únicamente para texto (recordemos que los metacaracteres se usan solo para nombres de archivos). Las palabras generadas en una expansión no tienen por qué coincidir con ficheros.
- $ echo Rule{A1,A2, A3,B1,C1,C2}
  id:: 6632f4b7-f59c-487d-b5b0-a10c966a9928
  RuleA1 RuleA2 RuleA3 RuleB1 RuleC1 RuleC2
-
- $ echo Rule{1..5}
- Rule1 Rule2 Rule3 Rule4 Rule5