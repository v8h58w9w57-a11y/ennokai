-- 親睦会ポータル: タスク管理（行事の準備でやること。担当・期限・完了）
create table if not exists public.ennokai_tasks (
  id         uuid primary key default gen_random_uuid(),
  event_id   uuid references public.ennokai_events(id) on delete cascade,
  title      text not null,
  who        text not null default '',
  due        date,
  note       text not null default '',
  done       boolean not null default false,
  done_at    timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index if not exists ennokai_tasks_event on public.ennokai_tasks (event_id, done, due);
alter table public.ennokai_tasks enable row level security;
drop policy if exists ennokai_tasks_all on public.ennokai_tasks;
create policy ennokai_tasks_all on public.ennokai_tasks for all to anon, authenticated using (true) with check (true);
grant select, insert, update, delete on public.ennokai_tasks to anon, authenticated;
