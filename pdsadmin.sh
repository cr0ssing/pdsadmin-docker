#! /bin/sh

# Copyright (C) 2024 Robin Lamberti.

# This file is part of pdsadmin-docker.

# pdsadmin-docker is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# pdsadmin-docker is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with pdsadmin-docker. If not, see <http://www.gnu.org/licenses/>.

docker exec -it pdsadmin ./pdsadmin.sh $@
