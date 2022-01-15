:- use_module(library(random)).
         
preporuci:-
	zapocniRazgovor,
	zanrFilma,
	stoljeceFilma,
	godinaFilma,
	preporukaFilma,
	josPreporuka.

zapocniRazgovor:-
        trenutnoPrica(ja),
        moguciOdgovor(pozdrav, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        ispisOdgovora(Izabran),
        writeln('Ja sam MovieBot3000 i tu sam da vam pomognem odabrati film'), 
        flush_output.
     
zanrFilma:-
	trenutnoPrica(ja),
	writeln('Koji žanr filma tražite?'),
	writeln('1.Horror'),
	writeln('2.Akcija'),
	writeln('3.Thriller'),
	writeln('4.Sci-fi'),
	writeln('5.Komedija'),
	trenutnoPrica(ti),
	read(X), 
	(not(X = 1; X = 2; X = 3; X = 4; X = 5; number(X)) -> trenutnoPrica(ja), 	  
		writeln('Pogrešan unos!'), 
		zanrFilma,
		true;
		trenutnoPrica(ja),
		odgovorZahvale,
		zapisiUDatoteku('korisnickiOdgovor.dat', X),
		zapisiUDatoteku('korisnickiOdgovor.dat', '.'),
		zapisiUDatoteku('korisnickiOdgovor.dat', '\n'),
		true).
		
stoljeceFilma:-
	trenutnoPrica(ja),
	writeln('Koji stoljeće preferirate 20 ili 21?'),
	trenutnoPrica(ti),
	read(X), 
	( not(X = 20; X = 21) -> trenutnoPrica(ja), 	  
		writeln('Pogrešan unos!\nMolim unesite broj 20 ili 21!'), 
		stoljeceFilma,
		true;
		trenutnoPrica(ja),
		odgovorZahvale,
		zapisiUDatoteku('korisnickiOdgovor.dat', X),
		zapisiUDatoteku('korisnickiOdgovor.dat', '.'),
		zapisiUDatoteku('korisnickiOdgovor.dat', '\n'),
	true).

godinaFilma:-
	trenutnoPrica(ja),
	write('Koju godinu tražite?'),
	nl,
	trenutnoPrica(ti),
	read(Godina),
	( not(number(Godina)) ->
		trenutnoPrica(ja), writeln('Niste unjeli brojku!'), godinaFilma,true;
		dohvatiStoljece(Stoljece),
		(Stoljece=20 ->
			((Godina>2000;Godina<1890)->
				trenutnoPrica(ja),writeln('Pogrešan unos!\nMolim unesite broj izemđu 1890 i 2000!'),godinaFilma,true;
				trenutnoPrica(ja),write('Super'),zapisiUDatoteku('korisnickiOdgovor.dat',Godina),zapisiUDatoteku('korisnickiOdgovor.dat', '.'),
				zapisiUDatoteku('korisnickiOdgovor.dat', '\n'),true)
				,true;	
				((Godina>2022;Godina<2001)->
					trenutnoPrica(ja),writeln('Pogrešan unos!\nMolim unesite broj izemđu 2001 i 2022!'),godinaFilma,true;
					trenutnoPrica(ja),write('Super'),zapisiUDatoteku('korisnickiOdgovor.dat', Godina),zapisiUDatoteku('korisnickiOdgovor.dat', '.'),
					zapisiUDatoteku('korisnickiOdgovor.dat', '\n'),true)
		,true),
	true).

preporukaFilma:-
	trenutnoPrica(ja),
        writeln('Preporučam vam film: '),
	preporuciFilm.

preporuciFilm:-
	dohvatiZanr(Zanr),
	dohvatiGodinu(Godina),
	(Zanr=1->
		(Godina=<2000->devetHorror,true;
    		(Godina=<2010->desetHorror,true;
    		dvadesetHorror,true),true),true;true),
	(Zanr=2->
		(Godina=<2000->devetAkcija,true;
    		(Godina=<2010->desetAkcija,true;
    		dvadesetAkcija,true),true),true;true),
    	(Zanr=3->
		((Godina=<2000)->devetDrama,true;
    		((Godina=<2010)->desetDrama,true;
    		dvadesetDrama,true),true),true;true),
    	(Zanr=4->
		(Godina=<2000->devetSci,true;
    		(Godina=<2010->desetSci,true;
    		dvadesetSci,true),true),true;true),
    	(Zanr=5->
		(Godina=<2000->devetKomedija,true;
    		(Godina=<2010->desetKomedija,true;
    		dvadesetKomedija,true),true),true;true).
 
josPreporuka:-
	trenutnoPrica(ja),
	writeln('Želite li preporuku za drugačiju vrstu filma?'),
	writeln('1. Da'),
	writeln('2. Ne'),
	read(Unos),
	( not(number(Unos)) ->
	trenutnoPrica(ja), writeln('Niste unjeli brojku!'), josPreporuka,true;
	(Unos=1->
		delete_file('korisnickiOdgovor.dat'),
		preporuci,
		true;
		iskljuci,
		true
	),true).
 
iskljuci:- 
	pozdraviKorisnika, 
	delete_file('korisnickiOdgovor.dat').

odgovorZahvale:-
	moguciOdgovor(zahvala, Kategorija),
	nasumicniIzbor(Kategorija, Izabran),
	trenutnoPrica(ja),
	ispisOdgovora(Izabran),
	flush_output.
	
pozdraviKorisnika:-
	moguciOdgovor(odlazak, Kategorija),
	nasumicniIzbor(Kategorija, Izabran),
	trenutnoPrica(ja),
	ispisOdgovora(Izabran),
	flush_output.
          			
devetHorror:-		
	moguciOdgovor(hororDevet, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        trenutnoPrica(ja),
        ispisOdgovora(Izabran),
        flush_output.

desetHorror:-		
	moguciOdgovor(hororDeset, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        trenutnoPrica(ja),
        ispisOdgovora(Izabran),
        flush_output.

dvadesetHorror:-		
	moguciOdgovor(hororDvadeset, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        trenutnoPrica(ja),
        ispisOdgovora(Izabran),
        flush_output.
 
 devetAkcija:-		
	moguciOdgovor(akcijaDevet, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        trenutnoPrica(ja),
        ispisOdgovora(Izabran),
        flush_output.

desetAkcija:-		
	moguciOdgovor(akcijaDeset, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        trenutnoPrica(ja),
        ispisOdgovora(Izabran),
        flush_output.

dvadesetAkcija:-		
	moguciOdgovor(akcijaDvadeset, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        trenutnoPrica(ja),
        ispisOdgovora(Izabran),
        flush_output. 
        
devetDrama:-		
	moguciOdgovor(dramaDevet, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        trenutnoPrica(ja),
        ispisOdgovora(Izabran),
        flush_output.

desetDrama:-		
	moguciOdgovor(dramaDeset, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        trenutnoPrica(ja),
        ispisOdgovora(Izabran),
        flush_output.

dvadesetDrama:-		
	moguciOdgovor(dramaDvadeset, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        trenutnoPrica(ja),
        ispisOdgovora(Izabran),
        flush_output.
       
devetSci:-		
	moguciOdgovor(sciDevet, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        trenutnoPrica(ja),
        ispisOdgovora(Izabran),
        flush_output.

desetSci:-		
	moguciOdgovor(sciDeset, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        trenutnoPrica(ja),
        ispisOdgovora(Izabran),
        flush_output.

dvadesetSci:-		
	moguciOdgovor(sciDvadeset, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        trenutnoPrica(ja),
        ispisOdgovora(Izabran),
        flush_output.
        
devetKomedija:-		
	moguciOdgovor(komedijaDevet, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        trenutnoPrica(ja),
        ispisOdgovora(Izabran),
        flush_output.

desetKomedija:-		
	moguciOdgovor(komedijaDeset, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        trenutnoPrica(ja),
        ispisOdgovora(Izabran),
        flush_output.

dvadesetKomedija:-		
	moguciOdgovor(komedijaDvadeset, Kategorija),
        nasumicniIzbor(Kategorija, Izabran),
        trenutnoPrica(ja),
        ispisOdgovora(Izabran),
        flush_output. 
          
dohvatiLinije(L):-
  setup_call_cleanup(
    open('korisnickiOdgovor.dat', read, Stream),
    citajPodatke(Stream, L),
    close(Stream)
  ).

citajPodatke(Stream, L):-
  read_term(Stream, G, []),
  (   G == end_of_file  ->  
  L = []; 
  L = [G|T], citajPodatke(Stream,T)  ).
  
dohvatiZanr(OdabraniZanr) :- 
	dohvatiLinije(L),
	nth0(0,L,X), 
	OdabraniZanr is X.

dohvatiStoljece(OdabranoStoljece) :- 
	dohvatiLinije(L),
	nth0(1,L,X), 
	OdabranoStoljece is X.
	
dohvatiGodinu(OdabranaGodina):-
	dohvatiLinije(L),
	nth0(2,L,X), 
	OdabranaGodina is X.
		
zapisiUDatoteku(Datoteka, Text) :-
	open(Datoteka, append, Stream),
	write(Stream, Text), nl,
	close(Stream).
	
ispisOdgovora([]):- nl.
ispisOdgovora([G|R]):- write(G), write(' '), ispisOdgovora(R).

nth_item([G|_], 1, G).
nth_item([_|R], N, X):-
        nth_item(R, N1, X),
        N is N1 + 1.
       
nasumicniIzbor(Res, R):- 
        length(Res, Length),  
        Upper is Length + 1,
        random(1, Upper, Rand),
        nth_item(Res, Rand, R).
 
bot('MovieBot3000: ').
korisnik('GuestUser: ').

trenutnoPrica(ja):-
        bot(X), write(X), flush_output.
trenutnoPrica(ti):-
        korisnik(X), write(X), flush_output.

moguciOdgovor(pozdrav, [
        ['Pozdrav!'], 
        ['Hej'],
        ['Bok'], 
        ['Hello'],
        ['Konichiwa'],
        ['Dobro jutro'],
        ['Dobar dan']
        ]).
        
moguciOdgovor(zahvala, [
        ['Hvala na odgovoru!'], 
        ['Super'], 
        ['Zanimljivo'],
        ['Dobar izbor']
        ]).
        
moguciOdgovor(odlazak, [
        ['Hvala na druženju'], 
        ['Pozdrav'], 
        ['Ćao'],
        ['Bokić']
        ]).
        
moguciOdgovor(hororDevet, [
      ['Scream'],
      ['Candyman'],
      ['Event Horizon'],
      ['The Silence of the Lambs'],
      ['Misery'],
      ['Tales From the Crypt: Demon Knight'],
      ['From Dusk Till Dawn ']
        ]).
        
moguciOdgovor(hororDeset, [
     ['Severance'],
     ['Silent Hill'],
     ['The Gathering'],
     ['Hostel: Part II'],
     ['Hostel'],
     ['Exorcist: The Beginning'],
     ['Fright Night']
        ]).

moguciOdgovor(hororDvadeset, [
      ['Sinister'],
      ['Lights Out'],
      ['Ouija: Origin of Evil'],
      ['The Conjuring'],
      ['10 Cloverfield Lane'],
      ['The Woman in Black'],
      ['Devil']
        ]).

moguciOdgovor(akcijaDevet, [
      ['Total Recall'],
      ['La Femme Nikita'],
      ['The Last Boy Scout'],
      ['Point Break'],
      ['Terminator 2: Judgment Day'],
      ['Hard Boiled'],
      ['Hard Target']
        ]).
        
moguciOdgovor(akcijaDeset, [
     ['Inception'],
     ['The Dark Knight'],
     ['Avatar'],
     ['The Bourne Ultimatum'],
     ['Casino Royale'],
     ['Serenity'],
     ['Iron Man']
        ]).

moguciOdgovor(akcijaDvadeset, [
      ['Iron man 2'],
      ['Iron Man 3'],
      ['John Wick'],
      ['Logan'],
      ['Edge of Tomorrow'],
      ['The Revenant'],
      ['Looper']
        ]).

moguciOdgovor(dramaDevet, [
      ['Misery'],
      ['eXistenZ'],
      ['A Simple Plan'],
      ['Open Your Eyes'],
      ['Basic Instinct'],
      ['In the Mouth of Madness'],
      ['Stir of Echoes']
        ]).
        
moguciOdgovor(dramaDeset, [
     ['Trapped'],
     ['Identity'],
     ['One Hour Photo'],
     ['Panic Room'],
     ['Memento'],
     ['Insomnia'],
     ['Donnie Darko']
        ]).

moguciOdgovor(dramaDvadeset, [
      ['Parasite'],
      ['Uncut Gems'],
      ['Searching'],
      ['You Were Never Really Here'],
      ['The Invitation'],
      ['The Invisible Man'],
      ['Im Thinking of Ending Things']
        ]).	
        
moguciOdgovor(sciDevet, [
      ['Ghost In The Shell'],
      ['Wax Or The Discovery Of Television Among The Bees'],
      ['Until The End Of The World'],
      ['Memories'],
      ['12 Monkeys'],
      ['Total Recall']
        ]).
        
moguciOdgovor(sciDeset, [
     ['A.I. Artificial Intelligence'],
     ['Battlefield Earth'],
     ['Fortress 2: Re-Entry'],
     ['Mission to Mars'],
     ['Red Planet'],
     ['Pitch Black'],
     ['The 6th Day']
        ]).

moguciOdgovor(sciDvadeset, [
      ['Interstellar'],
      ['Gravity'],
      ['Predestination'],
      ['Coherence'],
      ['Cloud Atlas'],
      ['Under the Skin'],
      ['Melancholia']
        ]).       
        
moguciOdgovor(komedijaDevet, [
      ['Dumb and Dumber'],
      ['Clerks'],
      ['Tommy Boy'],
      ['Half Baked'],
      ['Office Space'],
      ['A Night At The Roxbury'],
      ['Ace Ventura: Pet Detective']
        ]).
        
moguciOdgovor(komedijaDeset, [
     ['Miss Congeniality'],
     ['102 Dalmatians'],
     ['Little Nicky'],
     ['Keeping the Faith'],
     ['The Emperors New Groove'],
     ['Big Mommas House'],
     ['Love Is an Elephant']
        ]).

moguciOdgovor(komedijaDvadeset, [
      ['Crazy, Stupid, Love'],
      ['Just Go with It'],
      ['The Hangover Part II'],
      ['Something Borrowed '],
      ['The Smurfs'],
      ['Friends with Benefits'],
      ['Mr.']
        ]).       
        
               
