DROP TABLE phones;

CREATE TABLE phones(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  storage VARCHAR(255),
  colour VARCHAR(255)
)