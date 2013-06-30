DATE_AT_FORMAT = "%d/%m/%Y %H:%M"
DATE_ON_FORMAT = "%d/%m/%Y"

Time::DATE_FORMATS.merge!(
    :standard => DATE_AT_FORMAT,
    :default => DATE_AT_FORMAT,
    :standard_time => DATE_AT_FORMAT
)

Date::DATE_FORMATS.merge!(
    :standard => DATE_ON_FORMAT,
    :default => DATE_ON_FORMAT,
    :standard_time => DATE_ON_FORMAT
)