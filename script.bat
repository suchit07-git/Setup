@echo off

for /l %%i in (1, 1, 100) do (
		echo %%i
		%1 %%i > input.txt
		%2 < input.txt > output.txt
		%3 < input.txt > answer.txt
		
		fc /n output.txt answer.txt || goto :out
)

:out
