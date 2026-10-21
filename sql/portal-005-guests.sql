-- 行事ごとの参加者（その行事だけに参加する人）: event_id が入っている人は、その行事の名簿にだけ出る
alter table public.ennokai_roster add column if not exists event_id uuid references public.ennokai_events(id) on delete cascade;
create index if not exists ennokai_roster_event on public.ennokai_roster (event_id);
