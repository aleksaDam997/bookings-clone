INSERT INTO rooms (room_name, created_at, updated_at) VALUES
('General''s Quarters', '2024-04-03 00:00:00', '2024-04-03 00:00:00'),
('Major''s Suite', '2024-04-07 00:00:00', '2024-04-07 00:00:00') ON CONFLICT DO NOTHING;
