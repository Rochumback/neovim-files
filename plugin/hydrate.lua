require("hydrate").setup({
    -- The interval between notifications in minutes
    minute_interval = 20,

    -- The render style for notifications
    -- Accepted values are "default", "minimal", "simple" or "compact"
    render_style = "default",

    -- Loads time of last drink on startup
    -- Useful if you don't have long-running neovim instances
    -- or if you tend to have multiple instances running at a time
    persist_timer = false,

    -- Sets the reminder message after "minute_interval" minutes have
    -- passed to the the specified message
    msg_hydrate_now = " 💧 Time for a drink ",

    -- Sets the message after acknowledging the reminder to the
    -- specified message
    msg_hydrated = " 💧 You've had a drink, timer reset 💧",

    -- Sets text displayed before time in minutes for
    -- ":HydrateWhen" message
    msg_minutes_until = "Drink due in",
})
