-- 親睦会ポータル: 打ち合わせの項目を増やす（話すこと・事前準備・保留・予算・次回など）
alter table public.ennokai_meetings add column if not exists extra jsonb not null default '{}'::jsonb;
