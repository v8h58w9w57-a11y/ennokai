-- 親睦会ポータル: 行事の打ち合わせ（日時・内容・決まったこと・やること）
create table if not exists public.ennokai_meetings (
  id         uuid primary key default gen_random_uuid(),
  event_id   uuid references public.ennokai_events(id) on delete cascade,
  date       text,
  time       text,
  place      text,
  attendees  text,
  content    text,
  decisions  text,
  todos      jsonb not null default '[]'::jsonb,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists ennokai_meetings_event on public.ennokai_meetings (event_id, date);
alter table public.ennokai_meetings enable row level security;
drop policy if exists ennokai_meetings_all on public.ennokai_meetings;
create policy ennokai_meetings_all on public.ennokai_meetings for all to anon, authenticated using (true) with check (true);
grant select, insert, update, delete on public.ennokai_meetings to anon, authenticated;
