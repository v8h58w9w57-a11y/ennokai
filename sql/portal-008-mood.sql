-- 行事ごとの「雰囲気」（着せ替え）を手で選べるようにする
-- 空（null）のときは行事名から自動で選ぶ。値: pastel / night / wa / sakura / summer / pop
alter table public.ennokai_events add column if not exists mood text;
