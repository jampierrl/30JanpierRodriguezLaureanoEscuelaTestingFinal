# Proyecto de Pruebas Automatizadas con Karate

Este proyecto contiene un conjunto de pruebas automatizadas para la API Pet Store
# 
TAG enumerados: para StoresRunner y UsersRunner
@TEST 1
@TEST 2
@TEST 3
@TEST 4
@TEST 5
@TEST 6
@TEST 7
@TEST 8
# Ejecutar se la siguiente manera por TAG, por Runner y por env=dev
mvn clean test -Dtest=UsersRunner -Dkarate.options="--tags @TEST-1" -Dkarate.env=dev
mvn clean test -Dtest=StoresRunner -Dkarate.options="--tags @TEST-1" -Dkarate.env=dev
