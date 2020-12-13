all:
	erl -sname 10250 -boot ./math -config ./sys
clean:
	rm -rf  *~ */*~ */*/*~
doc_gen:
	rm -rf  node_config logfiles doc/*;
	erlc ../doc_gen.erl;
	erl -s doc_gen start -sname doc

release:
	rm -rf adder_service/ebin/* divi_service/ebin/*;
	rm -rf multi_service/ebin/*;
	cp ../../services/adder_service/src/*.app adder_service/ebin;
	erlc -o adder_service/ebin ../../services/adder_service/src/*.erl;
	cp ../../services/divi_service/src/*.app divi_service/ebin;
	erlc -o divi_service/ebin ../../services/divi_service/src/*.erl;
	cp ../../services/multi_service/src/*.app multi_service/ebin;
	erlc -o multi_service/ebin ../../services/multi_service/src/*.erl

test:
	rm -rf  ebin/* test_ebin/* src/*~ test_src/*~ *~ erl_crash.dump src/*.beam test_src/*.beam;
	rm -rf Mnesia*;
#	common
	cp ../common/src/*app ebin;
	erlc -o ebin ../common/src/*.erl;
#	dbase
	cp ../dbase_service/src/*app ebin;
	erlc -o ebin ../dbase_service/src/*.erl;
#	iaas
	cp src/*app ebin;
	erlc -o ebin src/*.erl;
	erlc -o test_ebin test_src/*.erl;
	erl -pa ebin -pa ebin -pa test_ebin -s iaas_tests start -name 10250 -setcookie abc
