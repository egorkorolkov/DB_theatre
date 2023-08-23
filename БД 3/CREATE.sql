CREATE TABLE [Playbill] (
	ID integer NOT NULL,
	Performance_ID integer NOT NULL,
	Date date NOT NULL,
	Time time NOT NULL,
	Premiere varchar(255) NOT NULL,
  CONSTRAINT [PK_PLAYBILL] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  )

)

CREATE TABLE [Repertoire] (
	Performance_ID integer NOT NULL,
	Name varchar(255) NOT NULL,
	Type_ID integer NOT NULL,
	Genre_ID integer NOT NULL,
	Author varchar(255),
	Duration time NOT NULL,
  CONSTRAINT [PK_REPERTOIRE] PRIMARY KEY CLUSTERED
  (
  [Performance_ID] ASC
  )

)

CREATE TABLE [Genres] (
	Genre_ID integer NOT NULL,
	Name varchar(255) NOT NULL,
  CONSTRAINT [PK_GENRES] PRIMARY KEY CLUSTERED
  (
  [Genre_ID] ASC
  )

)

CREATE TABLE [Actors&Performers] (
	Character_ID integer NOT NULL,
	Soloist_ID integer NOT NULL,
  CONSTRAINT [PK_ACTORS&PERFORMERS] PRIMARY KEY CLUSTERED
  (
  [Character_ID] ASC,
  [Soloist_ID] ASC
  )

)

CREATE TABLE [List_of_characters] (
	Character_ID integer NOT NULL,
	Name varchar(255) NOT NULL,
	Performance_ID integer NOT NULL,
  CONSTRAINT [PK_LIST_OF_CHARACTERS] PRIMARY KEY CLUSTERED
  (
  [Character_ID] ASC
  )

)

CREATE TABLE [Departments] (
	Department_ID integer NOT NULL,
	Name varchar(255) NOT NULL,
  CONSTRAINT [PK_DEPARTMENTS] PRIMARY KEY CLUSTERED
  (
  [Department_ID] ASC
  )

)

CREATE TABLE [Prices] (
	ID integer NOT NULL,
	Category_ID integer NOT NULL,
	Type_ID integer NOT NULL,
	Period_ID integer NOT NULL,
	Zone_ID integer NOT NULL,
	Price integer NOT NULL,
  CONSTRAINT [PK_PRICES] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  )

)

CREATE TABLE [Category] (
	Category_ID integer NOT NULL,
	Name varchar(255) NOT NULL,
  CONSTRAINT [PK_CATEGORY] PRIMARY KEY CLUSTERED
  (
  [Category_ID] ASC
  )

)
CREATE TABLE [Category_of_performance] (
	Category_ID integer NOT NULL,
	Performance_ID integer NOT NULL,
  CONSTRAINT [PK_CATEGORY_OF_PERFORMANCE] PRIMARY KEY CLUSTERED
  (
  [Category_ID] ASC,
  [Performance_ID] ASC
  )

)

CREATE TABLE [Employee] (
	Employee_ID integer NOT NULL,
	Name varchar(255) NOT NULL,
	Gender varchar,
	Awards varchar(255),
	Birth_date date,
	Graduated varchar(255),
	Hire_date date,
	Department_ID integer NOT NULL,
	Position_ID integer NOT NULL,
  CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED
  (
  [Employee_ID] ASC
  )

)

CREATE TABLE [Types] (
	Type_ID integer NOT NULL,
	Type varchar(255) NOT NULL,
  CONSTRAINT [PK_TYPES] PRIMARY KEY CLUSTERED
  (
  [Type_ID] ASC
  )

)

CREATE TABLE [Orchestra] (
	Musician_ID integer NOT NULL,
	Instrument_ID integer NOT NULL,
  CONSTRAINT [PK_ORCHESTRA] PRIMARY KEY CLUSTERED
  (
  [Musician_ID] ASC
  )

)

CREATE TABLE [Instruments] (
	Instrument_ID integer NOT NULL,
	Name varchar(255) NOT NULL,
  CONSTRAINT [PK_INSTRUMENTS] PRIMARY KEY CLUSTERED
  (
  [Instrument_ID] ASC
  )

)

CREATE TABLE [Positions] (
	Position_ID integer NOT NULL,
	Name varchar(255) NOT NULL,
  CONSTRAINT [PK_POSITIONS] PRIMARY KEY CLUSTERED
  (
  [Position_ID] ASC
  )

)

CREATE TABLE [Artistic_direction] (
	Performance_ID integer NOT NULL,
	Person integer NOT NULL,
  CONSTRAINT [PK_ARTISTIC_DIRECTION] PRIMARY KEY CLUSTERED
  (
  [Performance_ID] ASC,
  [Person] ASC
  )

)

CREATE TABLE [Places] (
	ID integer NOT NULL,
	Row integer NOT NULL,
	Seat integer NOT NULL,
	Zone integer NOT NULL,
  CONSTRAINT [PK_PLACES] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  )

)

CREATE TABLE [Parts] (
	Part_ID integer NOT NULL,
	Name varchar(255) NOT NULL,
  CONSTRAINT [PK_PARTS] PRIMARY KEY CLUSTERED
  (
  [Part_ID] ASC
  )

)

CREATE TABLE [Zones] (
	Zone_ID integer NOT NULL,
	Name varchar(255) NOT NULL,
	Part_ID integer NOT NULL,
  CONSTRAINT [PK_ZONES] PRIMARY KEY CLUSTERED
  (
  [Zone_ID] ASC
  )

)

CREATE TABLE [Periods] (
	ID integer NOT NULL,
	Description varchar(255) NOT NULL,
  CONSTRAINT [PK_PERIODS] PRIMARY KEY CLUSTERED
  (
  [ID] ASC
  )

)

CREATE TABLE [Ensemble&Ballet] (
	Performance_ID integer NOT NULL,
	Person integer NOT NULL,
  CONSTRAINT [PK_ENSEMBLE&BALLET] PRIMARY KEY CLUSTERED
  (
  [Performance_ID] ASC,
  [Person] ASC
  )

)

ALTER TABLE [Playbill] WITH CHECK ADD CONSTRAINT [Playbill_fk0] FOREIGN KEY ([Performance_ID]) REFERENCES [Repertoire]([Performance_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [Playbill] CHECK CONSTRAINT [Playbill_fk0]


ALTER TABLE [Repertoire] WITH CHECK ADD CONSTRAINT [Repertoire_fk0] FOREIGN KEY ([Type_ID]) REFERENCES [Types]([Type_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Repertoire] CHECK CONSTRAINT [Repertoire_fk0]
ALTER TABLE [Repertoire] WITH CHECK ADD CONSTRAINT [Repertoire_fk1] FOREIGN KEY ([Genre_ID]) REFERENCES [Genres]([Genre_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Repertoire] CHECK CONSTRAINT [Repertoire_fk1]


ALTER TABLE [Actors&Performers] WITH CHECK ADD CONSTRAINT [Actors&Performers_fk0] FOREIGN KEY ([Character_ID]) REFERENCES [List_of_characters]([Character_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [Actors&Performers] CHECK CONSTRAINT [Actors&Performers_fk0]
ALTER TABLE [Actors&Performers] WITH CHECK ADD CONSTRAINT [Actors&Performers_fk1] FOREIGN KEY ([Soloist_ID]) REFERENCES [Employee]([Employee_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Actors&Performers] CHECK CONSTRAINT [Actors&Performers_fk1]

ALTER TABLE [List_of_characters] WITH CHECK ADD CONSTRAINT [List_of_characters_fk0] FOREIGN KEY ([Performance_ID]) REFERENCES [Repertoire]([Performance_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [List_of_characters] CHECK CONSTRAINT [List_of_characters_fk0]


ALTER TABLE [Prices] WITH CHECK ADD CONSTRAINT [Prices_fk0] FOREIGN KEY ([Category_ID]) REFERENCES [Category]([Category_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Prices] CHECK CONSTRAINT [Prices_fk0]
ALTER TABLE [Prices] WITH CHECK ADD CONSTRAINT [Prices_fk1] FOREIGN KEY ([Type_ID]) REFERENCES [Types]([Type_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Prices] CHECK CONSTRAINT [Prices_fk1]
ALTER TABLE [Prices] WITH CHECK ADD CONSTRAINT [Prices_fk2] FOREIGN KEY ([Period_ID]) REFERENCES [Periods]([ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Prices] CHECK CONSTRAINT [Prices_fk2]
ALTER TABLE [Prices] WITH CHECK ADD CONSTRAINT [Prices_fk3] FOREIGN KEY ([Zone_ID]) REFERENCES [Zones]([Zone_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Prices] CHECK CONSTRAINT [Prices_fk3]


ALTER TABLE [Category_of_performance] WITH CHECK ADD CONSTRAINT [Category_of_performance_fk0] FOREIGN KEY ([Category_ID]) REFERENCES [Category]([Category_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Category_of_performance] CHECK CONSTRAINT [Category_of_performance_fk0]
ALTER TABLE [Category_of_performance] WITH CHECK ADD CONSTRAINT [Category_of_performance_fk1] FOREIGN KEY ([Performance_ID]) REFERENCES [Repertoire]([Performance_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
ALTER TABLE [Category_of_performance] CHECK CONSTRAINT [Category_of_performance_fk1]

ALTER TABLE [Employee] WITH CHECK ADD CONSTRAINT [Employee_fk0] FOREIGN KEY ([Department_ID]) REFERENCES [Departments]([Department_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Employee] CHECK CONSTRAINT [Employee_fk0]
ALTER TABLE [Employee] WITH CHECK ADD CONSTRAINT [Employee_fk1] FOREIGN KEY ([Position_ID]) REFERENCES [Positions]([Position_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Employee] CHECK CONSTRAINT [Employee_fk1]


ALTER TABLE [Orchestra] WITH CHECK ADD CONSTRAINT [Orchestra_fk0] FOREIGN KEY ([Musician_ID]) REFERENCES [Employee]([Employee_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Orchestra] CHECK CONSTRAINT [Orchestra_fk0]
ALTER TABLE [Orchestra] WITH CHECK ADD CONSTRAINT [Orchestra_fk1] FOREIGN KEY ([Instrument_ID]) REFERENCES [Instruments]([Instrument_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Orchestra] CHECK CONSTRAINT [Orchestra_fk1]



ALTER TABLE [Artistic_direction] WITH CHECK ADD CONSTRAINT [Artistic_direction_fk0] FOREIGN KEY ([Performance_ID]) REFERENCES [Repertoire]([Performance_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Artistic_direction] CHECK CONSTRAINT [Artistic_direction_fk0]
ALTER TABLE [Artistic_direction] WITH CHECK ADD CONSTRAINT [Artistic_direction_fk1] FOREIGN KEY ([Person]) REFERENCES [Employee]([Employee_ID])
ON UPDATE NO ACTION
ON DELETE NO ACTION

ALTER TABLE [Artistic_direction] CHECK CONSTRAINT [Artistic_direction_fk1]

ALTER TABLE [Places] WITH CHECK ADD CONSTRAINT [Places_fk0] FOREIGN KEY ([Zone]) REFERENCES [Zones]([Zone_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Places] CHECK CONSTRAINT [Places_fk0]


ALTER TABLE [Zones] WITH CHECK ADD CONSTRAINT [Zones_fk0] FOREIGN KEY ([Part_ID]) REFERENCES [Parts]([Part_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Zones] CHECK CONSTRAINT [Zones_fk0]


ALTER TABLE [Ensemble&Ballet] WITH CHECK ADD CONSTRAINT [Ensemble&Ballet_fk0] FOREIGN KEY ([Performance_ID]) REFERENCES [Repertoire]([Performance_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Ensemble&Ballet] CHECK CONSTRAINT [Ensemble&Ballet_fk0]
ALTER TABLE [Ensemble&Ballet] WITH CHECK ADD CONSTRAINT [Ensemble&Ballet_fk1] FOREIGN KEY ([Person]) REFERENCES [Employee]([Employee_ID])
ON UPDATE CASCADE
ON DELETE NO ACTION
ALTER TABLE [Ensemble&Ballet] CHECK CONSTRAINT [Ensemble&Ballet_fk1]

