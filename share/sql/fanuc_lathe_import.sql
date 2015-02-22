/*FANUC-LATHE STYLE IMPORTER
Valid tags are :Tool :Pocket :X :Y :Z :U :V :W :A :B :C 
 :Diameter, :Frontangle :Backangle :Orientation :Comment */
BEGIN TRANSACTION;
INSERT INTO tools (ToolID, T_number, geom) VALUES (:Tool, :Tool, :Tool);
INSERT INTO offsets (offsetID, description, X, Y, Z, A, B, C, U, V, W, D) 
            VALUES (:Tool, "Wear", 0, 0, 0, 0, 0, 0, 0, 0, 0, :Diameter);
INSERT INTO offsets (offsetID, description, X, Y, Z, A, B, C, U, V, W, D) 
            VALUES ((10000 + :Tool), "Base", :X, :Y, :Z, :A, :B, :C, :U, :V, :W, :Diameter);
INSERT INTO geometries (geomID, description, orientation, frontangle, backangle) 
            VALUES (:Tool, ":Comment", :Orientation, :Frontangle, :Backangle);
INSERT INTO pockets (magazineID , pocketID, toolID, slot_pos, pocket_offs)
            VALUES (0, :Pocket, :Tool, NULL, NULL);

/* These are singletons, but the iterator can't do that */
INSERT OR REPLACE INTO spindles (spindleID, description, toolID, spindle_hrs)
                VALUES (0, "default spindle", 0, 0);
INSERT OR REPLACE INTO magazines (magazineID, description, type)
                VALUES (0, "Default magazine", "rotary");
                     
COMMIT;
     
            