# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

#��������� � ����������� ���������, ��� �������� � ������ ���������:
# #encoding: utf-8
Time::DATE_FORMATS[:ru_datetime] = "%d.%m.%Y %k:%M:%S"
