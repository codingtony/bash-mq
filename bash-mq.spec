%define name %{_name}
%define version %VERSION%
%define release %RELEASE%
%define arch noarch
%define basedir /opt/bash-mq

%define buildroot %{_topdir}/BUILDROOT


Name: %{name}
Version: %{version}	
Release: %{release}
Summary: %{name}

Group:		Application/Utils
License:	DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE V2
BuildRoot:	%{buildroot}
Source0:	%{name}.tar.gz
Requires:	socat

%description
A bash/awk producer/consumer for activemq or any STOMP compatible MQ

%prep
tar zxf %{_topdir}/SOURCES/%{name}.tar.gz

	
%build


%install
mkdir -p %{buildroot}%{basedir}/bin


cp stomp-parser.awk %{buildroot}%{basedir}/bin
cp consume %{buildroot}%{basedir}/bin
cp produce %{buildroot}%{basedir}/bin


%clean
rm -rf %{buildroot}


%files
%defattr(-,root,root,-)
%{basedir}/



%changelog

