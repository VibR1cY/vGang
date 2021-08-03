INSERT INTO `addon_account` (name, label, shared) VALUES
  ("society_vagos", "Vagos", 1),
  ("society_ballas", "Ballas", 1);

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ("society_vagos", "Vagos", 1),
  ("society_ballas", "Ballas", 1);

INSERT INTO `datastore` (name, label, shared) VALUES
  ("society_vagos", "Vagos", 1),
  ("society_ballas", "Ballas", 1);

INSERT INTO `job2_grades` (job2_name, grade, name, label, salary, skin_male, skin_female) VALUES
    ("vagos", 0, "pequeno", "Pequeño", 0, "{}", "{}"),
    ("vagos", 1, "asistente", "Asistente", 0, "{}", "{}"),
    ("vagos", 2, "teniente", "Teniente", 0, "{}", "{}"),
    ("vagos", 3, "soldado", "Soldado", 0, "{}", "{}"),
    ("vagos", 4, "segundo", "Segundo", 0, "{}", "{}"),
    ("vagos", 5, "boss", "Jefe", 0, "{}", "{}"),
    ("ballas", 0, "habitants", "Habitants", 0, "{}", "{}"),
    ("ballas", 1, "dealers", "Dealers", 0, "{}", "{}"),
    ("ballas", 2, "bras", "Bras Droit", 0, "{}", "{}"),
    ("ballas", 3, "boss", "OG", 0, "{}", "{}");

INSERT INTO `jobs2` (name, label) VALUES
  ("vagos", "Vagos"),
  ("ballas", "Ballas");